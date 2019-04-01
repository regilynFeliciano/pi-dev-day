package pi.dev.day;

import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Header;
import io.micronaut.http.client.annotation.Client;
import pi.dev.day.model.User;

@Client(GithubClientConfiguration.GITHUB_API_URL)
@Header(name = "User-Agent", value = "${github.user}")
@Header(name = "Authorization", value = "token ${github.token}")
public interface GithubClient {

	@Get("graphql")
	String queryGraph(@Body String query);

	@Get("user")
	User getCurrentUser();

}
