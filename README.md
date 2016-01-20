# search-problem

```
Usage: search.rb [options]
        --term1 TERM1                The first search term (required)
        --term2 TERM2                The second saech term (required)
        --context NUM                The number of words apart the two search terms are (required)
        --dir DIRECTORY              The directory to search (required)
    -h, --help                       Prints this help
```

### example

```
[search-problem (master)]$ ./search.rb --term1 it --term2 if --context 5 --dir test-files/
"file_name: f1 first matching string: it if"
"file_name: f2 first matching string: if miss he as upon. \n\nAs it"
[search-problem (master)]$ ./search.rb --term1 it --term2 if --context 1 --dir test-files/
"file_name: f1 first matching string: it if"
```
