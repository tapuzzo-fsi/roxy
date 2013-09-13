xquery version "1.0-ml";

module namespace t="http://marklogic.com/roxy/test";

import module "http://marklogic.com/roxy/test" at "/test/lib/test-helper.xqy";

import module namespace pager = "http://marklogic.com/roxy/pager-lib" at "/app/views/helpers/pager-lib.xqy";

declare namespace xhtml = "http://www.w3.org/1999/xhtml";

declare option xdmp:mapping "false";

declare function t:paginate()
{
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>1</current-page>
      <total-pages>4</total-pages>
      <page-length>100</page-length>
      <previous-index/>
      <previous-page/>
      <next-index>101</next-index>
      <next-page>2</next-page>
      <showing>
        <start>1</start>
        <end>100</end>
        <total>301</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="1" total="301" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>2</current-page>
      <total-pages>4</total-pages>
      <page-length>100</page-length>
      <previous-index>1</previous-index>
      <previous-page>1</previous-page>
      <next-index>201</next-index>
      <next-page>3</next-page>
      <showing>
        <start>101</start>
        <end>200</end>
        <total>301</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="101" total="301" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>3</current-page>
      <total-pages>4</total-pages>
      <page-length>100</page-length>
      <previous-index>101</previous-index>
      <previous-page>2</previous-page>
      <next-index>301</next-index>
      <next-page>4</next-page>
      <showing>
        <start>201</start>
        <end>300</end>
        <total>301</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="201" total="301" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>4</current-page>
      <total-pages>4</total-pages>
      <page-length>100</page-length>
      <previous-index>201</previous-index>
      <previous-page>3</previous-page>
      <next-index/>
      <next-page/>
      <showing>
        <start>301</start>
        <end>301</end>
        <total>301</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="301" total="301" page-length="100"/>, 4)),

  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>1</current-page>
      <total-pages>11</total-pages>
      <page-length>100</page-length>
      <previous-index/>
      <previous-page/>
      <next-index>101</next-index>
      <next-page>2</next-page>
      <showing>
        <start>1</start>
        <end>100</end>
        <total>1001</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="1" total="1001" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>2</current-page>
      <total-pages>11</total-pages>
      <page-length>100</page-length>
      <previous-index>1</previous-index>
      <previous-page>1</previous-page>
      <next-index>201</next-index>
      <next-page>3</next-page>
      <showing>
        <start>101</start>
        <end>200</end>
        <total>1001</total>
      </showing>
      <links>
        <link>2</link>
        <link>3</link>
        <link>4</link>
        <link>5</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="101" total="1001" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>3</current-page>
      <total-pages>11</total-pages>
      <page-length>100</page-length>
      <previous-index>101</previous-index>
      <previous-page>2</previous-page>
      <next-index>301</next-index>
      <next-page>4</next-page>
      <showing>
        <start>201</start>
        <end>300</end>
        <total>1001</total>
      </showing>
      <links>
        <link>1</link>
        <link>2</link>
        <link>3</link>
        <link>4</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="201" total="1001" page-length="100"/>, 4)),
  t:assert-equal(
    <pagination xmlns="http://marklogic.com/roxy/pager-lib">
      <current-page>11</current-page>
      <total-pages>11</total-pages>
      <page-length>100</page-length>
      <previous-index>901</previous-index>
      <previous-page>10</previous-page>
      <next-index/>
      <next-page/>
      <showing>
        <start>1001</start>
        <end>1001</end>
        <total>1001</total>
      </showing>
      <links>
        <link>8</link>
        <link>9</link>
        <link>10</link>
        <link>11</link>
      </links>
    </pagination>,
    pager:paginate(<response xmlns="http://marklogic.com/appservices/search" start="1001" total="1001" page-length="100"/>, 4)),
  t:assert-equal(
    (
      <span class="page-numbers" xmlns="http://www.w3.org/1999/xhtml">Results <b>1</b> to <b>100</b> of <b>1001</b></span>,
      <span class="next" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=101">»</a></span>
    ),
    pager:pagination(<response xmlns="http://marklogic.com/appservices/search" start="1" total="1001" page-length="100"/>, "/search", "index")),

  t:assert-equal(
    (
      <span class="previous" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=701">«</a></span>,
      <span class="page-numbers" xmlns="http://www.w3.org/1999/xhtml">Results <b>801</b> to <b>900</b> of <b>1001</b></span>,
      <span class="next" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=901">»</a></span>
    ),
    pager:pagination(<response xmlns="http://marklogic.com/appservices/search" start="801" total="1001" page-length="100"/>, "/search", "index")),

  t:assert-equal(
    (
      <span class="previous" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=801">«</a></span>,
      <span class="page-numbers" xmlns="http://www.w3.org/1999/xhtml">Results <b>901</b> to <b>1000</b> of <b>1001</b></span>,
      <span class="next" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=1001">»</a></span>
    ),
    pager:pagination(<response xmlns="http://marklogic.com/appservices/search" start="901" total="1001" page-length="100"/>, "/search", "index")),

  t:assert-equal(
    (
      <span class="previous" xmlns="http://www.w3.org/1999/xhtml"><a href="/search?index=901">«</a></span>,
      <span class="page-numbers" xmlns="http://www.w3.org/1999/xhtml">Results <b>1001</b> to <b>1001</b> of <b>1001</b></span>
    ),
    pager:pagination(<response xmlns="http://marklogic.com/appservices/search" start="1001" total="1001" page-length="100"/>, "/search", "index"))
};