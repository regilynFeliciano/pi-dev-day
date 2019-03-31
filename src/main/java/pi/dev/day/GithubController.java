package pi.dev.day;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import pi.dev.day.model.User;

import javax.inject.Inject;

@Controller("/github")
public class GithubController {

	@Inject
	private GithubService githubService;

	@Get("/user")
	public User getUser() {
		return githubService.getUser();
	}

}
