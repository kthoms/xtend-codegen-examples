package xtend.codegen.uml.validation

import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.xtext.validation.AbstractDeclarativeValidator
import org.eclipse.xtext.validation.Check

class BasicConstraints extends AbstractDeclarativeValidator {
	UMLPackage pck = UMLPackage.eINSTANCE
	
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
	def check_Class (Class it) {
		if (getAllAttributes.empty) {
			warning("Class "+name+" does not have any attributes", it, pck.namedElement_Name)
		}
	}

	@Check(NORMAL)
	def check_Property (org.eclipse.uml2.uml.Property it) {
		if (name==null) {
			error("Property must have a name", it, pck.namedElement_Name)
		} else {
			if (Character.isUpperCase(name.charAt(0))) {
				warning("Property name '"+name+"' should start with a capital", it, pck.namedElement_Name)
			}
		}
	}
}
