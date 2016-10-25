package xtend.codegen.uml.templates

import javax.inject.Inject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator

class Root implements IGenerator {
	@Inject JavaBeanTemplate javaBeanTemplate
	// add more templates here
	
	override doGenerate(Resource input, IFileSystemAccess fsa) {
		javaBeanTemplate.doGenerate(input,fsa)
	}
	
}