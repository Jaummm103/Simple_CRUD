SET SERVEROUTPUT ON -- para poder visualizar a saida PUT_LINE

-- Chamando a procedure para Criar/Inserir um funcionário
BEGIN
   INSERIR_FUNCIONARIO(1, 'João Silva', 'Desenvolvedor', 5000);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Chamando a procedure para Consultar um funcionário
BEGIN
    CONSULTAR_FUNCIONARIO(2);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Chamando a procedure para Atualizar o salário de um funcionário
BEGIN
    ATUALIZAR_SALARIO(1, 5500);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Chamando a procedure para Deletar um funcionário
BEGIN
    DELETAR_FUNCIONARIO(1);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)
