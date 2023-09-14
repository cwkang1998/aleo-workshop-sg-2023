program my_weird_weird_token.aleo {
    
    record Token {
        owner: address,
        balance: u32,
    }

    transition mint(balance: u32) -> Token {
        assert_eq(self.caller, aleo1c5c24skzvfxuegt0ykeldhcv8s7nstfjk530qdywga5jaacn9g8qk7musl);
        return Token {
            owner: self.caller,
            balance: balance,
        };        
    }

    transition mint_to(to: address, balance: u32) -> Token {
        assert_eq(self.caller, aleo1c5c24skzvfxuegt0ykeldhcv8s7nstfjk530qdywga5jaacn9g8qk7musl);
        return Token {
            owner: to,
            balance: balance,
        };
    }

    transition transfer(receiver: address, amount: u32, input: Token) -> (Token, Token) {
        let balance: u32 = input.balance - amount;
        let recipient: Token = Token {
            owner: receiver,
            balance: amount,
        };

        let sender: Token  = Token {
            owner: self.caller,
            balance
        };

        return (recipient, sender);
    }
}