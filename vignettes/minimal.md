<!--
%\VignetteIndexEntry{Less Is More -- Tinyverse Edition}
%\VignetteEngine{simplermarkdown::mdweave_to_html}
%\VignetteEncoding{UTF-8}
-->
---
title: "Less Is More -- Tinyverse Edition"
---

## Demo

A quick example of accessing (public) data (from a PostgreSQL database) and summarising it.


```{.R #Example}
library(lim.tiny)
data <- getData()
res <- dataSummary(data)
res
```
