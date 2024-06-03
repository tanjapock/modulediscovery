process ADDHEADER {
    tag "$meta.id"
    container 'docker.io/quirinmanz/gt2biopax:0.1.0'

    input:
    tuple val(meta), path(file)
    val header

    output:
    tuple val(meta), file("${meta.id}.withHeader.txt")

    script:
    """
    addheader.py --input $file  --header $header   --output_file ${meta.id}.withHeader.txt
    """
}
