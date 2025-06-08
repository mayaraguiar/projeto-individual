var infoGestanteModel = require("../models/infoGestanteModel");

function cadastrarInfoGestante(req, res) {
    var gesta = req.body.gestaServer;
    var paridade = req.body.paridadeServer;
    var aborto = req.body.abaixoServer;
    var numPN = req.body.numPNServer;
    var numPC = req.body.numPCServer;
    var dum= req.body.dumServer;
    var dpp= req.body.dppServer;
    var altoRisco= req.body.altoRiscoServer;
    var statusPreNatal= req.body.statusPreNatalServer;


    if (gesta == undefined) {
        res.status(400).send("Seu campo 'gesta' undefined!");
    } else if (paridade == undefined) {
        res.status(400).send("Seu campo 'paridade' undefined!");
    } else if (aborto == undefined) {
        res.status(400).send("Seu campo 'aborto' undefined!");
    } else if (numPN == undefined) {
        res.status(400).send("Seu campo 'numPN' undefined!");
    }  else if (numPC == undefined) {
        res.status(400).send("Seu campo 'numPC' undefined!");
    }  else if (dum == undefined) {
        res.status(400).send("Seu campo 'dum' undefined!");
    } else if (dpp == undefined) {
        res.status(400).send("Seu campo 'dpp' undefined!");
    } else if (altoRisco == undefined) {
        res.status(400).send("Seu campo 'Alto Risco' undefined!");
    } else if (statusPreNatal == undefined) {
        res.status(400).send("Seu campo 'statusPreNatal' undefined!");
    }else (
        infoGestanteModel.cadastrarInfoGestante(gesta, paridade, aborto, numPN, numPC, dum, dpp, altoRisco, statusPreNatal, fkGestante)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao cadastrar as informações da gestante! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            )
    )

}

module.exports = {
    cadastrarInfoGestante
}