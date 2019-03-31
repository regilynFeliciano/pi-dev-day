package pi.dev.day.model;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class User {
	private String login;
	private String name;
}
