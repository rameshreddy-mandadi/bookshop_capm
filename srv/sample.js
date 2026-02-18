//Before the action happens
this.Before('READ', Books, async(req) => {})
//During the action handling
this.on('READ', Books, async(req, next) => {
    return next()
})

//After the action happens
this.after('READ', Books, async(books, req) => {})

//website to understand in detai - https://cap.cloud.sap/docs/node.js/core-services#srv-on-before-after