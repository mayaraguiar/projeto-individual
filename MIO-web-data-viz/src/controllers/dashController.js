var dashModel = require("../models/dashModel");

function buscarDataProvavelDoParto(req, res) {

     const limite_linhas = 7;

     var idAquario = req.params.idAquario;

    console.log(`Recuperando gestantes com Data Provável do Parto dos últimos ${limite_linhas} meses`);

    dashModel.buscarDataProvavelDoParto(idAquario, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarGestanteAtiva(req, res) {


    dashModel.buscarGestanteAtiva().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarGestanteAtiva(req, res) {


    dashModel.buscarGestanteAtiva().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
function buscarAltoRisco(req, res) {


    dashModel.buscarAltoRisco().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    buscarDataProvavelDoParto,
    buscarGestanteAtiva,
    buscarAltoRisco
}