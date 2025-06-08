var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/dataProvavelParto", function (req, res) {
    dashController.buscarDataProvavelDoParto(req, res);
});

router.get("/qtdPreNatal",)


module.exports = router;