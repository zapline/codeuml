function generateDiagram (
    [string]$diagramText,
    [string]$fileName
    )
    {

        $input = new-object System.Collections.Specialized.NameValueCollection;
        $input.Add("uml", $diagramText);
        $wc = new-object System.Net.WebClient;
        $response = $wc.UploadValues("http://codeuml.com/SendUml.ashx", $input);
        $key = [System.Text.Encoding]::UTF8.GetString($response);
        $downloadUrl = "http://codeuml.com/getimage.ashx?key=" + $key;
        $wc.DownloadFile($downloadUrl, $fileName);
        $wc.Dispose();
    }
    
    
generateDiagram "A->B: Hello" "class.png"
generateDiagram "(A)->(B): Hello" "usecase.png"