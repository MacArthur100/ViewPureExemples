Observações práticas & dicas para o GitHub / Remix

    Arquivo no GitHub: crie ViewPureExamples.sol com o código acima e um README.md explicando como testar.

    Testes no Remix:

        Deploy: informe um valor inicial (ex.: 42).

        Clique em getNumber() → retorna 42.

        doubleStored() → 84.

        add(2, 3) → 5 (pure — sem gas via call).

        divide(10, 2) → 5. divide(1,0) → reverte com "division by zero".

        concatAndHash("a","b") → bytes32 hash.

        getBlockTimestamp() → timestamp do bloco (atual).

        setNumber(100) → faz transação (gasta gas). Depois getNumber() retorna 100.

    Diferença prática view vs pure:

        view: pode ler storage (variáveis do contrato) ou variáveis globais (ex.: block.timestamp) — não pode modificar.

        pure: não pode ler storage nem variáveis globais; depende só dos parâmetros e da lógica interna.
