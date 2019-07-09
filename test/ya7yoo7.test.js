const Ya7yoo7 = artifacts.require('./ya7yoo7.sol')

contract('ya7yoo7', (accounts) => {
    before(async() => {
        this.ya7yoo7 = await Ya7yoo7.deployed()
    })

    it('deploys successfully', async() => {
        const address = await this.ya7yoo7.address
        assert.notEqual(address, 0x0)
        assert.notEqual(address, '')
        assert.notEqual(address, null)
        assert.notEqual(address, undefined)
    })

    it('The Total Supply is set to 1*10^6', async() => {
        const totalSupply = await this.ya7yoo7.totalSupply()
        assert.equal(totalSupply, 1000000)
    })
    it('The Balance Of', async() => {
        const balanceOf = await this.ya7yoo7.balanceOf(accounts[0])
        assert.equal(balanceOf, 1000000)
    })
    it('Symbole and Name are right', async() => {
        const name = await this.ya7yoo7.name()
        const symbole = await this.ya7yoo7.symbole()
        assert.equal(name, "ya7yoo7")
        assert.equal(symbole, "YTA")
    })
    it('Transfer Function event Trigered & returned true', async() => {
        const transfer = await this.ya7yoo7.transfer('0xf695b57bd17dae4738b0eebb88f264b5ba4557d6', 100)
        assert.equal(transfer.logs[0].event, "Transfer")
    })
    it('Addresse Approved', async() => {
        const approve = await this.ya7yoo7.approve('0xf695b57bd17dae4738b0eebb88f264b5ba4557d6', 100)
        assert.equal(approve.logs[0].event, "Approval")
    })
    it('Transfer From Function event Trigered', async() => {
        const approve = await this.ya7yoo7.approve('0xf695b57bd17dae4738b0eebb88f264b5ba4557d6', 100)
        const transferFrom = await this.ya7yoo7.transferFrom('0xf695b57bd17dae4738b0eebb88f264b5ba4557d6', '0x848b093a6a96a44536ca22c59d01dd7522a3e649', 10)
        assert.equal(approve.logs[0].event, "Approval")
        assert.equal(transferFrom.logs[0].event, "Transfer")
    })


})