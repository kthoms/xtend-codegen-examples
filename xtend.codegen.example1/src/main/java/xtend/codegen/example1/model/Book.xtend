package xtend.codegen.example1.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Book {
	String title
	int pages
	BookCategory category
	Writer author
}