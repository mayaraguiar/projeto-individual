var database = require("../database/config");

function buscarDataProvavelDoParto() { // Modificado para mudar informações

    var instrucaoSql = ` SELECT MONTH(dpp) AS mes, COUNT(*) AS total
                         FROM infoGestante
                         GROUP BY MONTH(dpp)
                         ORDER BY mes;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarGestanteAtiva() { // Modificado para mudar informações

    var instrucaoSql = ` SELECT COUNT(*) AS totalGestantesAtivas
                         FROM infoGestante

                         WHERE statusPreNatal = 'Sim';`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarAltoRisco() { // Modificado para mudar informações

    var instrucaoSql = `  SELECT count(*) as nomeGestante 
                            FROM gestante g
                            JOIN infoGestante i ON g.idGestante = i.fkGestante
                            WHERE i.altoRisco = 'Sim';`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDataProvavelDoParto,
    buscarGestanteAtiva,
    buscarAltoRisco
}
