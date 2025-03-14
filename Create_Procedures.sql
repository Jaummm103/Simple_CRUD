-- Criando uma procedure: Inserir funcionário
CREATE OR REPLACE PROCEDURE INSERIR_FUNCIONARIO(
    p_ID_FUNCIONARIO IN FUNCIONARIOS.ID_FUNCIONARIO%TYPE,
    p_NOME           IN FUNCIONARIOS.NOME%TYPE,
    p_CARGO          IN FUNCIONARIOS.CARGO%TYPE,
    p_SALARIO        IN FUNCIONARIOS.SALARIO%TYPE )
AS
BEGIN
  INSERT
  INTO FUNCIONARIOS
    (
      ID_FUNCIONARIO,
      NOME,
      CARGO,
      SALARIO
    )
    VALUES
    (
      p_ID_FUNCIONARIO,
      p_NOME,
      p_CARGO,
      p_SALARIO
    );
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Funcionário inserido com sucesso!');
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro ao inserir funcionário: ' || SQLERRM);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Criando uma procedure: Consultar Funcionário
CREATE OR REPLACE PROCEDURE CONSULTAR_FUNCIONARIO
  (
    p_ID_FUNCIONARIO IN FUNCIONARIOS.ID_FUNCIONARIO%TYPE -- parâmetro de entrada (é o padrão). Significa que o valor é passado ao parâmetro e não pode ser alterado.
  )
AS
  v_NOME FUNCIONARIOS.NOME%TYPE;
  v_CARGO FUNCIONARIOS.CARGO%TYPE;
  v_SALARIO FUNCIONARIOS.SALARIO%TYPE;
BEGIN
  SELECT NOME,
    CARGO,
    SALARIO
  INTO v_NOME,
    v_CARGO,
    v_SALARIO
  FROM FUNCIONARIOS
  WHERE ID_FUNCIONARIO = p_ID_FUNCIONARIO;
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_NOME);
  DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_CARGO);
  DBMS_OUTPUT.PUT_LINE('Salário: ' || v_SALARIO);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro ao consultar funcionário: ' || SQLERRM);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Criando uma procedure: Atualizar Salario
CREATE OR REPLACE PROCEDURE ATUALIZAR_SALARIO(
    p_ID_FUNCIONARIO IN FUNCIONARIOS.ID_FUNCIONARIO%TYPE,
    p_NOVO_SALARIO   IN FUNCIONARIOS.SALARIO%TYPE )
AS
BEGIN
  UPDATE FUNCIONARIOS
  SET SALARIO          = p_NOVO_SALARIO
  WHERE ID_FUNCIONARIO = p_ID_FUNCIONARIO;
  IF SQL%ROWCOUNT      = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
  ELSE
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salário atualizado com sucesso!');
  END IF;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro ao atualizar salário: ' || SQLERRM);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)


-- Criando uma procedure: Deletar funcionario
CREATE OR REPLACE PROCEDURE DELETAR_FUNCIONARIO(
    p_ID_FUNCIONARIO IN FUNCIONARIOS.ID_FUNCIONARIO%TYPE )
AS
BEGIN
  DELETE FROM FUNCIONARIOS WHERE ID_FUNCIONARIO = p_ID_FUNCIONARIO;
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
  ELSE
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Funcionário deletado com sucesso!');
  END IF;
EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro ao excluir funcionário: ' || SQLERRM);
END;
-- (UTILIZAR A BARRA '/' QUANDO USAR O SQL*Plus, SQLcl, SQL Developer, CASO FOR O ORACLE SQL Developer NÃO PRECISA)