package pi.dev.day;

import io.micronaut.context.annotation.ConfigurationProperties;
import lombok.Getter;

import static pi.dev.day.GithubClientConfiguration.PREFIX;

@ConfigurationProperties(PREFIX)
public class GithubClientConfiguration {

	static final String PREFIX = "github";
	static final String GITHUB_API_URL = "https://api.github.com/";

	@Getter
	private String user;
	@Getter
	private String token;

}
