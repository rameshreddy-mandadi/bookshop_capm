const { Books } = require('#cds-models/BookstoreService')
const { Gener, Geners } = require('#cds-models/tutorial/db')
const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService {
  init() {

    const { Books } = cds.entities('BookstoreService')

    this.before('READ', Books, async (req) => {
      console.log('Before READ Books', req.data)
    })
    this.after('READ', Books, async (books, req) => {
      for (const book of books) {
        if (book.gener_code === Gener.Hobby) {
          book.price = book.price * 0.8
        }
      }
      console.log(books)
    })

    return super.init()
  }
}
