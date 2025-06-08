var gestanteModel = require("../models/gestanteModel");
var infoGestanteModel = require("../models/infoGestanteModel");

function buscarInfoGestanteController(req, res) {
  var idGestante = req.params.idGestante;

  gestanteModel.buscarInfoGestante(idGestante).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os aquarios: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function cadastrarComGestante(req, res) {

  var nomeGestante = req.body.nomeGestante;
  var statusPreNatal = req.body.statusPreNatal;
  var gesta = req.body.gesta;
  var paridade = req.body.paridade;
  var aborto = req.body.aborto;
  var numPN = req.body.numPN;
  var numPC = req.body.numPC;
  var dum = req.body.dum;
  var dpp = req.body.dpp;
  var altoRisco = req.body.altoRisco;
  var dtNascimento = req.body.dtNascimento;
  var telefone = req.body.telefone;



  if (nomeGestante == undefined) {
    res.status(400).send("Nome da gestante está undefined!");
  } else if (statusPreNatal == undefined) {
    res.status(400).send("Status do PreNatal está 'undefined!");
  } else if (gesta == undefined) {
    res.status(400).send("Campo Gesta undefined!");
  } else if (paridade == undefined) {
    res.status(400).send("Campo Paridade undefined!");
  } else if (aborto == undefined) {
    res.status(400).send("Campo Aborto undefined!");
  } else if (numPN == undefined) {
    res.status(400).send("Campo numero de PN está undefined!");
  } else if (numPC == undefined) {
    res.status(400).send("Campo numero de PC está undefined!");
  } else if (dum == undefined) {
    res.status(400).send("Campo DUM está undefined!");
  } else if (dpp == undefined) {
    res.status(400).send("Campo DPP está undefined!");
  } else if (altoRisco == undefined) {
    res.status(400).send("Campo alto risco  está undefined!");
  } else {

    gestanteModel.cadastrarGestante(nomeGestante, dtNascimento, telefone)
      .then(resultado => {
        if (resultado.length === 0) {
          res.status(400).send("Erro ao cadastrar gestante!");
          return;
        }

        console.log(' O RESULTADO É ESSE Ó: '+resultado);
        console.log('\nGestante cadastrada com sucesso!');
        const fkGestante = resultado.insertId;

        return infoGestanteModel.cadastrarInfoGestante(gesta, paridade, aborto, numPN, numPC, dum, dpp, altoRisco, statusPreNatal, fkGestante);


      })
      .then((resultado) => {
        res.status(201).json(resultado);
        console.log(resultado);
        console.log('\nPaciente cadastrado com sucesso!');
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}
module.exports = {
  cadastrarComGestante,
  buscarInfoGestanteController
}

// validações parametros, se null 