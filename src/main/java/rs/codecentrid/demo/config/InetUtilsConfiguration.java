package rs.codecentrid.demo.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import rs.codecentrid.demo.inet.InetUtils;
import rs.codecentrid.demo.inet.InetUtilsProperties;

@Configuration
public class InetUtilsConfiguration {

	@Bean
	public InetUtilsProperties inetUtilsProperties() {
		return new InetUtilsProperties();
	}

	@Bean
	@ConditionalOnMissingBean
	public InetUtils inetUtils(InetUtilsProperties properties) {
		return new InetUtils(properties);
	}

}
