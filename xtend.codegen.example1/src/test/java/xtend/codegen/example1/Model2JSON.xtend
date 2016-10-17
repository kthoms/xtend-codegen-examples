package xtend.codegen.example1

import xtend.codegen.example1.model.Book
import xtend.codegen.example1.model.Library
import xtend.codegen.example1.model.Writer
import xtend.codegen.example1.model.BookCategory
import com.google.gson.Gson
import com.google.gson.GsonBuilder

class Model2JSON {
	def static void main(String[] args) {
		val lib = new Library => [
			name = "mylibrary"
			
			val writer1 = new Writer => [name = "J.R.R. Tolkien"]
			val writer2 = new Writer => [name = "Douglas Adams"]
			writers = #[
				writer1,
				writer2
			]
			
			books = #[
				new Book => [
					author = writer1
					title = "The Lord of the Rings"
					category = BookCategory.Fantasy
					pages = 1178
				],
				new Book => [
					author = writer1
					title = "The Silmarillion"
					category = BookCategory.Fantasy
					pages = 384
				],
				new Book => [
					author = writer2
					title = "The Hitchhiker's Guide to the Galaxy"
					category = BookCategory.ScienceFiction
					pages = 224
				]
			]
		]
		
		val gson = new GsonBuilder().setPrettyPrinting().create
		println (gson.toJson(lib))
	}
}