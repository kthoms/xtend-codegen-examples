package xtend.codegen.example1.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Library {
	String   name
	Writer[] writers
	Book[]   books
}