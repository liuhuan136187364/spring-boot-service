package rs.codecentrid.demo;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.EnvironmentEndpoint;
import org.springframework.boot.actuate.endpoint.InfoEndpoint;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import rs.codecentrid.demo.inet.InetUtils;

@Controller
public class IndexController {

	@Autowired
	private InetUtils inetUtils;

	@Autowired
	private InfoEndpoint infoEndpoint;
	
	@Autowired
	private Environment env;

	@Autowired
	private EnvironmentEndpoint environmentEndpoint;

	@GetMapping("/")
	public String index(@ModelAttribute("model") ModelMap model) {
		model.addAttribute("env", environmentEndpoint.invoke());
		model.addAttribute("host", inetUtils.findFirstNonLoopbackHostInfo());
		model.addAttribute("info", infoEndpoint.invoke());
		if (StringUtils.isNotBlank(env.getProperty("DEPLOYMENT_GROUP"))) {
			model.addAttribute("DEPLOYMENT_GROUP", env.getProperty("DEPLOYMENT_GROUP"));
		} else {
			model.addAttribute("DEPLOYMENT_GROUP", "Unknown");
		}
		return "index";
	}
}
