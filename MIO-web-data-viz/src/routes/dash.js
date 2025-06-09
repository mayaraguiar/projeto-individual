var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/dataProvavelParto", function (req, res) {
    dashController.buscarDataProvavelDoParto(req, res);
});

router.get("/buscarGestanteAtiva", function (req, res) {
    dashController.buscarGestanteAtiva(req, res);
});
router.get("/buscarAltoRisco", function (req, res) {
    dashController.buscarAltoRisco(req, res);
});

module.exports = router;