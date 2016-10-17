package xtend.codegen.example1

import xtend.codegen.example1.model.Library

class Template {
	def generateHTML (Library it) '''
		<html>
			<body>
				<h1>Library «name»</h1>
				
				The library «name» contains «books.length» books from «books.map[author].toSet.size»
				different authors.
				
				<table>
					<tr><th>Title</th><th>Author</th><th>Category</th><th>Pages</th></tr>
					«FOR it: books.sortBy[title]»
						<tr>
							<td>«title»</td>
							<td>«author.name»</td>
							<td>«category»</td>
							<td>«pages»</td>
						</tr>
					«ENDFOR»
				</table>
			</body>
		</html>
	'''
}