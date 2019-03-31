package pi.dev.day;

import io.micronaut.scheduling.annotation.Scheduled;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class GithubJob {

	@Inject
	private GithubService githubService;

	@Scheduled(fixedRate = "10s")
	public void getUserJob() {
		System.out.println("-->> User: " + githubService.getUser().getLogin());
	}

}
