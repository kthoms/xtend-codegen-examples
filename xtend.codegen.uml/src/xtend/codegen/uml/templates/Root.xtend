package xtend.codegen.uml.templates

import javax.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator

class Root implements IGenerator {
	@Inject JavaBeanGen javaBeanGen
	
	override doGenerate(Resource input, IFileSystemAccess fsa) {
		javaBeanGen.doGenerate(input,fsa)
	}
	
}