const calc = artifacts.require("calculator");

module.exports = (deployer) =>{
    deployer.deploy(calc);
}