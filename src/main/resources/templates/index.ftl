<!DOCTYPE html>
<html>
<head>
<title>Spring Boot Service</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="app.css" />
	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container-fixed">
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Spring Boot Service</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
		<div class="jumbotron">
			<#assign hostInfo = model.host >
			<h1 class="deployment-group text-success"><small>Deployment group: </small>${model["DEPLOYMENT_GROUP"]}</h1>
			<h2 class="app-version text-success"><small>Version: </small>${model.info["version"]}</h2>
			<h2 class="hostname text-success"><small>Hostname: </small>${hostInfo.hostname}</h2>
			<h2 class="inet text-success"><small>IP Address: </small>${hostInfo.ipAddress}</h2>

			<div class="row info">
				<div class="col-lg-12 env">
				<#if model.env?has_content >
					<#list model.env?keys as key>
						<#assign val = model.env?values[key_index]>
						
						<div class="panel panel-success">
							<div class="panel-heading">${key}</div>
							<div class="panel-body">
								<table class="table table-striped">
									<collgroup>
										<col widthd=38%">
										<col widthd=62%">
									</collgroup>
									<tbody>
										<#if val?is_hash>
											<#list val as k, v>
											<tr>
	          									<td style="word-break: break-all;">${k}</td>
	          									<#if v?is_number>
	          									<td style="word-break: break-all; width: 62%;">${v?c}</td>
	          									<#else>
	          									<td style="word-break: break-all; width: 62%;">${v?string}</td>
	          									</#if>
	        								</tr>
											</#list>
										<#elseif val?is_collection>
											<#list val as v>
											<tr>
	          									<td style="word-break: break-all;">${key}</td>
	          									<td style="word-break: break-all; width: 62%;">${v?string}</td>
	        								</tr>
	        								</#list>
										</#if>
									</tbody>
								</table>
							</div>
						</div>
						
					</#list>
				</#if>
				</div>
			</div>
		</div>
		<footer class="footer">
			<p>&#9400 2016 codecentric</p>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>
