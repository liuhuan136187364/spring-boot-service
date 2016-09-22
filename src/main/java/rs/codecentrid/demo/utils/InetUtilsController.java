package rs.codecentrid.demo.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import rs.codecentrid.demo.utils.InetUtils.HostInfo;

@RestController
@RequestMapping("/inet")
public class InetUtilsController {
	
	@Autowired
	private InetUtils inetUtils;
	
	@RequestMapping(value = "", method=RequestMethod.GET)
	public HostInfo getHostInfo() {
		return inetUtils.findFirstNonLoopbackHostInfo();
	}

}
