 var database = require("../database/config");

 function buscarInfoGestante(idGestante) {

   var instrucaoSql = `SELECT * FROM infoGestante a WHERE fkGestante = ${idGestante}`; // mudar o sql

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
 }

 function cadastrar(nomeGestante, statusPreNatal, gesta, paridade, aborto, numPN, numPC, dum, dpp, altoRisco) {
  
   var instrucaoSql = `INSERT INTO  infoGestante (nomeGestante, gesta, paridade, aborto, numPN, numPC, dum, dpp, altoRisco)VALUES ('${nomeGestante}', ${gesta}, ${paridade}, ${aborto}, ${numPN}, ${numPC}, '${dum}', '${dpp}', '${altoRisco}')`;

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
 }


 module.exports = {
   buscarInfoGestante,
   cadastrar
 } // model controler e rota 
