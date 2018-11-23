package fr.dawan.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private List<String> ignoreList;

	public List<String> getIgnoreList() {
		return ignoreList;
	}

	public void setIgnoreList(List<String> ignoreList) {
		this.ignoreList = ignoreList;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String requestedUrl = request.getRequestURI();
		boolean urlAIgnorer = false;

		// checking url list to ignore
		for (String urlIgnoree : ignoreList) {
			// checking current url with ignore list
			if (requestedUrl.contains(urlIgnoree)) {
				urlAIgnorer = true;
				break;
			}
		}

		// if not URL to ignore
		if (!urlAIgnorer) {
			Object user = request.getSession().getAttribute("user");
			// no user logged => no access
			if (user == null) {
				// redirect to login
				System.out.println("Laaaaaaaaaaaa");
				request.getRequestDispatcher("login").forward(request, response);
			}
		}

		return true;
	}

}
