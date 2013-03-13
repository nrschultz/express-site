
exports.home = (req, res) =>
    res.render('standard/home', {headline: "Welcome"})

exports.about = (req, res) =>
    res.render('standard/about', {headline: "About Me"})
