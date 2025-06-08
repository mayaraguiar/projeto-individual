
var database = require("../database/config")

function cadastrarInfoGestante(gesta, paridade, aborto, numPN, NumPC, dum, dpp, altoRisco, statusPreNatal, fkGestante){
const instrucaoSql= `
    INSERT INTO infoGestante (gesta, paridade, aborto, numPN, NumPC, dum, dpp, altoRisco, statusPreNatal, fkGestante)
    VALUES (${gesta}, ${paridade}, ${aborto}, ${numPN}, ${NumPC}, '${dum}', '${dpp}', '${altoRisco}', '${statusPreNatal}', ${fkGestante})
    `;

    console.log('Olha o insert da infoGestante: '+ instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    cadastrarInfoGestante
}