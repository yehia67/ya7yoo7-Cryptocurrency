var ya7yoo7 = artifacts.require("./ya7yoo7.sol");
var ya7yoo7TokenSale = artifacts.require("./ya7yoo7TokenSale.sol");

module.exports = function(deployer) {
    deployer.deploy(ya7yoo7, 1000000).then(function() {
        return deployer.deploy(ya7yoo7TokenSale, ya7yoo7.address, 1000000000000000)
    });
};