const Ya7yoo7TokenSale = artifacts.require('./ya7yoo7TokenSale.sol')

contract('ya7yoo7TokenSale', (accounts) => {
    before(async() => {
        this.ya7yoo7TokenSale = await Ya7yoo7TokenSale.deployed()
    })

    it('deploys successfully', async() => {
        const address = await this.ya7yoo7TokenSale.address
        assert.notEqual(address, 0x0)
        assert.notEqual(address, '')
        assert.notEqual(address, null)
        assert.notEqual(address, undefined)
    })


})