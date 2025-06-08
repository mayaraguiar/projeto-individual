 var database = require("../database/config");

 function buscarInfoGestante(idGestante) {

   var instrucaoSql = `SELECT * FROM infoGestante a WHERE fkGestante = ${idGestante}`; // mudar o sql

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
 }


 function cadastrarGestante(nomeGestante, dtNascimento, telefone) {
  
  const instrucaoSql= `INSERT INTO gestante (nomeGestante, dtNascimento, telefone) VALUES ('${nomeGestante}','${dtNascimento}','${telefone}')`;
  
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  console.log("Gestante cadastrada com sucesso!");
  
  return database.executar(instrucaoSql);
 }

 module.exports = {
   buscarInfoGestante,
   cadastrarGestante 
 } // model controler e rota 
