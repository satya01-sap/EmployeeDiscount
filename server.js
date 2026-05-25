const cds = require('@sap/cds')

cds.on('bootstrap', (app) => {
    // Middleware to allow public access to metadata
    app.use((req, res, next) => {
        if (req.path === '/' || req.path === '/$metadata') {
            // Elevate the request to a privileged system user
            req.user = new cds.User.Privileged
        }
        next()
    })
})

module.exports = cds.server
