const SomeApp = {
    data() {
      return {
          books: [],
          bookForm: {},
          selectedbook: null,
        "books":  {
            title: {},
            author: {},
            yearpublished: {},
            publisher: {},
            page_count: {},
            msrp: {},
        },
      }
    },
    computed: {},
    methods: {
        fetchBooksData() {
            fetch('/api/books/')
            .then(response => response.json())
            .then( (responseJson) => {
                console.log(responseJson);
                this.books = responseJson;
            })
            .catch( (err) => {
                console.error(err);
            })
        },
         postNewBook(evt) {
                   
            console.log("Posting:", this.bookForm);
            // alert("Posting!");
    
            fetch('api/books/create.php', {
                method:'POST',
                body: JSON.stringify(this.bookForm),
                headers: {
                  "Content-Type": "application/json; charset=utf-8"
                }
              })
              .then( response => response.json() )
              .then( json => {
                console.log("Returned from post:", json);
                // TODO: test a result was returned!
                this.books = json;
                
                // reset the form
                this.bookForm = {};
              });
        },
        postNewbook(evt) {        
          
          console.log("Creating!", this.bookForm);
  
          fetch('api/books/create.php', {
              method:'POST',
              body: JSON.stringify(this.bookForm),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.bookForm = json;
              
              this.resetbookForm();
            })
            .catch( err => {
              alert("Something went horribly wrong!");
            });
        },
        postEditbook(evt) {
          this.bookForm.id = this.selectedbook.id;       
          
          console.log("Updating!", this.bookForm);
  
          fetch('api/books/update.php', {
              method:'POST',
              body: JSON.stringify(this.bookForm),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.bookForm = json;
              
              this.resetbookForm();
            });
        },
        postDeleteBook(o) {
          if (!confirm("Are you sure you want to delete the offer from "+o.companyName+"?")) {
              return;
          }
          
          fetch('api/books/delete.php', {
              method:'POST',
              body: JSON.stringify(o),
              headers: {
                "Content-Type": "application/json; charset=utf-8"
              }
            })
            .then( response => response.json() )
            .then( json => {
              console.log("Returned from post:", json);
              // TODO: test a result was returned!
              this.books = json;
              
              this.resetbookForm();
            });
        },
        selectBookForEdit(o) {
          this.selectedbook = o;
          this.bookForm = Object.assign({}, this.selectedbook);

        },
        resetbookForm() {
          this.selectedbook = null;
          this.bookForm = {};
        }
    },
    created() {
        this.fetchBooksData();
    }
}

Vue.createApp(SomeApp).mount('#someApp'); 





