package xtend.codegen.uml.templates

import org.eclipse.uml2.uml.PackageableElement

class Naming {
	
	def packageName (PackageableElement it) {
		val qnNearestPck = it.nearestPackage.qualifiedName
		qnNearestPck.substring(qnNearestPck.indexOf("::")+2).replace('::','.')
	}
	
	def packagePath (PackageableElement it) {
		packageName.replace('.','/')
	}
}