package xtend.codegen.example1.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Book {
	String title
	int pages = 100
	BookCategory category
	Writer author
}