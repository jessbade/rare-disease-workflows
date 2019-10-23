cwlVersion: v1.0
id: run-deepvar
label: run-deepvar
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: gcr.io/deepvariant-docker/deepvariant:0.8.0
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.bam-file)
      - $(inputs.ref)
      - $(inputs.bam-index)
      - $(inputs.indexed-fa)
  - class: InlineJavascriptRequirement
arguments:
  - valueFrom: $(inputs.output-prefix).vcf
    prefix: --output_vcf
  - valueFrom: $(inputs.output-prefix).g.vcf
    prefix: --output_gvcf

baseCommand:
  - /opt/deepvariant/bin/run_deepvariant

inputs:
  model-type:
    type: string
    inputBinding:
      position: 1
      prefix: --model_type
  ref:
    type: File
    inputBinding:
      position: 2
      prefix: --ref
  bam-file:
    type: File
    inputBinding:
      position: 3
      prefix: --reads
  num-shards:
    type: string
    inputBinding:
      position: 6
      prefix: --num_shards
  bam-index:
    type: File
  indexed-fa:
    type: File
  output-prefix:
    type: string

outputs:
  vcf-file:
    type: File
    outputBinding:
      glob: "*.vcf"
  gvcf-file:
    type: File
    outputBinding:
      glob: "*.gvcf"
