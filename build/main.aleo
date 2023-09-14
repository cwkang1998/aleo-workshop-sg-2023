program my_weird_weird_token.aleo;

record Token:
    owner as address.private;
    balance as u32.private;


function mint:
    input r0 as u32.private;
    assert.eq self.caller aleo1c5c24skzvfxuegt0ykeldhcv8s7nstfjk530qdywga5jaacn9g8qk7musl;
    cast self.caller r0 into r1 as Token.record;
    output r1 as Token.record;


function mint_to:
    input r0 as address.private;
    input r1 as u32.private;
    assert.eq self.caller aleo1c5c24skzvfxuegt0ykeldhcv8s7nstfjk530qdywga5jaacn9g8qk7musl;
    cast r0 r1 into r2 as Token.record;
    output r2 as Token.record;


function transfer:
    input r0 as address.private;
    input r1 as u32.private;
    input r2 as Token.record;
    sub r2.balance r1 into r3;
    cast r0 r1 into r4 as Token.record;
    cast self.caller r3 into r5 as Token.record;
    output r4 as Token.record;
    output r5 as Token.record;
