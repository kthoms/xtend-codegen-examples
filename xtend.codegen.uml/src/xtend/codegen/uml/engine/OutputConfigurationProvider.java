package xtend.codegen.uml.engine;

import static org.eclipse.xtext.xbase.lib.CollectionLiterals.newHashSet;
import java.util.Set;
import org.eclipse.xtext.generator.IFileSystemAccess;
import org.eclipse.xtext.generator.IOutputConfigurationProvider;
import org.eclipse.xtext.generator.OutputConfiguration;

public class OutputConfigurationProvider implements IOutputConfigurationProvider {

	public static final String GEN_ONCE_OUTPUT = "gen-once";

	/**
	 * @return a set of {@link OutputConfiguration} available for the generator
	 */
	public Set<OutputConfiguration> getOutputConfigurations() {
		OutputConfiguration defaultOutput = new OutputConfiguration(IFileSystemAccess.DEFAULT_OUTPUT);
		defaultOutput.setDescription("Output folder");
		defaultOutput.setOutputDirectory("./src-gen");
		defaultOutput.setOverrideExistingResources(true);
		defaultOutput.setCreateOutputDirectory(true);
		defaultOutput.setCleanUpDerivedResources(true);
		defaultOutput.setSetDerivedProperty(true);

		OutputConfiguration readonlyOutput = new OutputConfiguration(GEN_ONCE_OUTPUT);
		readonlyOutput.setDescription("Generate once output folder");
		readonlyOutput.setOutputDirectory("./src");
		readonlyOutput.setOverrideExistingResources(false);
		readonlyOutput.setCreateOutputDirectory(true);
		readonlyOutput.setCleanUpDerivedResources(false);
		readonlyOutput.setSetDerivedProperty(false);
		return newHashSet(defaultOutput, readonlyOutput);
	}
	
}
