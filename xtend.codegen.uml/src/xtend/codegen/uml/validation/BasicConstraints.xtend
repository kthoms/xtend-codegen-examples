package xtend.codegen.uml.validation

import javax.inject.Inject
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.xtext.validation.AbstractDeclarativeValidator
import org.eclipse.xtext.validation.Check

class BasicConstraints extends AbstractDeclarativeValidator {
	@Inject UMLPackage pck
	
	override protected getEPackages() {
		#[UMLPackage.eINSTANCE]
	}
	
	override isLanguageSpecific() {
		false
	}
	
	@Check(NORMAL)
	def check_Model (Model it) {
		if (name==null)
			error("Model must have a name", it, pck.namedElement_Name)
	}
	
	@Check(NORMAL)
	def check_Class (org.eclipse.uml2.uml.Class it) {
		if (getAllAttributes.empty) {
			warning("Class "+name+" does not have any attributes", it, pck.namedElement_Name)
		}
	}
}
