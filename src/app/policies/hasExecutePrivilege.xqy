(:
  Example policy that enforces that the current user has a particular configured execute privilege.
  
  To use this policy, you can do the following:
  1. Identify an execute privilege to protect your controller(s), either create a new one or use an existing privilege.
  2. Specify that privilege in src/app/config.xqy resource configuration for your controller
  3. After deployment, controller will return HTTP 403 if the user lacks the privilege
  
  Until the docs are updated, see link for details: https://github.com/marklogic/roxy/issues/615
:)
xquery version "1.0-ml";
declare namespace rest = "http://marklogic.com/appservices/rest";
declare variable $rest:policy as element(rest:policy) external;
try {
  xdmp:security-assert($rest:policy/rest:privilege, "execute")
} catch ($e) {
  fn:error(xs:QName('FORBIDDEN'), 'FORBIDDEN', $e/*:format-string)
}