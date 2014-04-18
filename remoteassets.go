/**
 * Remote Assets
 * http://cixtor.com/
 * https://github.com/cixtor/mamutools
 * http://en.wikipedia.org/wiki/Digital_asset
 *
 * List all the resources (assets) loaded in a specific page on a website.
 *
 * A digital asset is any item of text or media that has been formatted into a
 * binary source that includes the right to use it. A digital file without the
 * right to use it is not an asset. Digital assets are categorised in three major
 * groups which may be defined as textual content (digital assets), images (media
 * assets) and multimedia (media assets).
 */

package main

import (
    "os"
    "fmt"
    "flag"
    "net/url"
    "strings"
    "regexp"
)

var remote_loc = flag.String("url", "", "Specify the remote location to scan")
var filetype = flag.String("filetype", "", "Specify the filetype to look in the remote location specified")
var resource = flag.String("resource", "", "Specify a group of filestypes to include in the scanning: images, javascript, styles")
var scanby = flag.String("scanby", "", "Specify the type of scanning: tag, extension")

func main() {
    flag.Usage = func(){
        fmt.Println("Remote Assets")
        fmt.Println("  http://cixtor.com/")
        fmt.Println("  https://github.com/cixtor/mamutools")
        fmt.Println("  http://en.wikipedia.org/wiki/Digital_asset")
        fmt.Println("Usage:")
        flag.PrintDefaults()
    }

    flag.Parse()

    *remote_loc = strings.TrimSpace(*remote_loc)
    if *remote_loc == "" {
        flag.Usage()
        fmt.Printf("\nError: Remote location not specified\n")
        os.Exit(1)
    }

    re := regexp.MustCompile(`^(http|https):\/\/$`)
    var url_scheme []string = re.FindStringSubmatch(*remote_loc)
    if url_scheme == nil {
    	*remote_loc = fmt.Sprintf("http://%s", *remote_loc)
    }

    location, err := url.Parse(*remote_loc)
    if err != nil {
    	panic(err)
    }

    if *scanby == "extension" {
        /* This value is allowed. */
    } else {
        *scanby = "tag"
    }

    var filetypes []string
    if *filetype != "" {
        filetypes = append(filetypes, *filetype)
    } else if *resource != "" {
        switch *resource {
        case "images":
            filetypes = []string{ "gif", "jpg", "jpeg", "png", "svg" }
        case "javascript":
            filetypes = []string{ "js", "coffee" }
        case "styles":
            filetypes = []string{ "css", "sass", "less" }
        }
    }

    fmt.Printf("Hostname: %s\n", location.Host)
    fmt.Printf("Target: %s\n", *remote_loc)
    fmt.Printf("Scan-by: %s\n", *scanby)
    fmt.Printf("Extensions: %s\n", strings.Join(filetypes, ", "))
    fmt.Printf("-----------\n" )
}
