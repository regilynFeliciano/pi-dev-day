package pi.dev.day;

import pi.dev.day.model.User;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class GithubService {

	@Inject
	private GithubClient githubClient;

	private static final String USER_QUERY = "query { viewer { login name }}";

	public User getUser() {
		return githubClient.getCurrentUser();
	}

}
