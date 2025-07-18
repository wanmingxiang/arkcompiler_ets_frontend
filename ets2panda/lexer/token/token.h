/**
 * Copyright (c) 2021-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ES2PANDA_PARSER_CORE_TOKEN_H
#define ES2PANDA_PARSER_CORE_TOKEN_H

#include "lexer/token/sourceLocation.h"
#include "generated/tokenType.h"
#include "lexer/token/number.h"
#include "util/es2pandaMacros.h"
#include "util/enumbitops.h"
#include "util/ustring.h"

namespace ark::es2panda::lexer {

using ENUMBITOPS_OPERATORS;

enum class TokenFlags : uint32_t {
    NONE = 0U,
    NEW_LINE = 1U << 0U,
    HAS_ESCAPE = 1U << 2U,
    NUMBER_BIGINT = 1U << 3U,
    NUMBER_FLOAT = 1U << 4U,
    NUMBER_HAS_UNDERSCORE = 1U << 5U,
};

}  // namespace ark::es2panda::lexer

template <>
struct enumbitops::IsAllowedType<ark::es2panda::lexer::TokenFlags> : std::true_type {
};

namespace ark::es2panda::lexer {

class Token {
public:
    Token() = default;
    DEFAULT_COPY_SEMANTIC(Token);
    DEFAULT_MOVE_SEMANTIC(Token);
    ~Token() = default;

    friend class Lexer;
    friend class ETSLexer;

    TokenType Type() const
    {
        return type_;
    }

    TokenFlags Flags() const
    {
        return flags_;
    }

    char16_t Utf16() const
    {
        return c16_;
    }

    void SetTokenType(TokenType type)
    {
        type_ = type;
    }

    void SetTokenStr(util::StringView error)
    {
        src_ = error;
    }

    TokenType KeywordType() const
    {
        return keywordType_;
    }

    const SourcePosition &Start() const
    {
        return loc_.start;
    }

    const SourcePosition &End() const
    {
        return loc_.end;
    }

    const SourceRange &Loc() const
    {
        return loc_;
    }

    const util::StringView &Ident() const
    {
        return src_;
    }

    const util::StringView &BigInt() const
    {
        ES2PANDA_ASSERT(type_ == TokenType::LITERAL_NUMBER && (flags_ & TokenFlags::NUMBER_BIGINT));
        return src_;
    }

    Number GetNumber() const
    {
        ES2PANDA_ASSERT(type_ == TokenType::LITERAL_NUMBER && !(flags_ & TokenFlags::NUMBER_BIGINT));
        return number_;
    }

    const util::StringView &String() const
    {
        ES2PANDA_ASSERT(type_ == TokenType::LITERAL_STRING || type_ == TokenType::LITERAL_NUMBER ||
                        type_ == TokenType::LITERAL_CHAR);
        return src_;
    }

    bool NewLine() const
    {
        return (flags_ & TokenFlags::NEW_LINE) != 0;
    }

    bool IsAccessability() const;
    bool IsAsyncModifier() const;
    bool IsForInOf() const;
    bool IsStaticModifier() const;
    bool IsDeclareModifier() const;
    bool IsReadonlyModifier() const;
    bool IsUpdate() const;
    bool IsUnary() const;
    [[nodiscard]] bool IsLiteral() const noexcept;
    [[nodiscard]] bool IsPropNameLiteral() const noexcept;
    [[nodiscard]] std::string_view ToString() const noexcept;
    bool IsKeyword() const;
    bool IsReservedTypeName() const;
    bool IsDefinableTypeName() const;
    bool IsPredefinedType() const;

    static bool IsBinaryToken(TokenType type);
    static bool IsBinaryLvalueToken(TokenType type);
    static bool IsUpdateToken(TokenType type);
    static bool IsPunctuatorToken(TokenType type);
    static bool IsTsParamToken(TokenType type);

private:
    friend class KeywordsUtil;
    TokenType type_ {TokenType::EOS};
    TokenType keywordType_ {TokenType::EOS};
    TokenFlags flags_ {TokenFlags::NONE};
    SourceRange loc_ {};
    Number number_ {};
    util::StringView src_ {};
    char16_t c16_ {};
};
}  // namespace ark::es2panda::lexer

#endif /* TOKEN_H */
