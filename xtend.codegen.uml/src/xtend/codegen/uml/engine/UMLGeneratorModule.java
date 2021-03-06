package xtend.codegen.uml.engine;

import org.eclipse.emf.ecore.EValidator;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.xtext.generator.IGenerator;
import org.eclipse.xtext.generator.IOutputConfigurationProvider;
import org.eclipse.xtext.naming.DefaultDeclarativeQualifiedNameProvider;
import org.eclipse.xtext.naming.IQualifiedNameProvider;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.generic.AbstractGenericResourceRuntimeModule;
import org.eclipse.xtext.service.SingletonBinding;
import org.eclipse.xtext.validation.IResourceValidator;

import xtend.codegen.uml.templates.Root;
import xtend.codegen.uml.validation.BasicConstraints;

public class UMLGeneratorModule extends AbstractGenericResourceRuntimeModule {
	public Class<? extends ResourceSet> bindResourceSet() {
		return ResourceSetImpl.class;
	}

	@Override
	public Class<? extends IQualifiedNameProvider> bindIQualifiedNameProvider() {
		return DefaultDeclarativeQualifiedNameProvider.class;
	}

	@Override
	protected String getFileExtensions() {
		return "uml";
	}

	@Override
	protected String getLanguageName() {
		return "uml";
	}

	public Class<? extends IResourceFactory> bindIResourceFactory() {
		return UMLResourceFactory.class;
	}

	// suppress validation of profiles
	public Class<? extends IResourceValidator> bindIResourceValidator () {
		return ResourceValidatorImplExt.class;
	}

	public EValidator.Registry bindEValidatorRegistry() {
		return EValidator.Registry.INSTANCE;
	}
	
	@SingletonBinding(eager = true)
	public Class<? extends BasicConstraints> bindBasicConstraints() {
		return BasicConstraints.class;
	}
	
	public Class<? extends IGenerator> bindIGenerator() {
		return Root.class;
	}

	@SingletonBinding
	public Class<? extends IOutputConfigurationProvider> bindIOutputConfigurationProvider() {
		return OutputConfigurationProvider.class;
	}

}
